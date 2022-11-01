//
// Created in 2022
// Using Swift 5.0
// On 10.08.2022 by Alex Dremov
// 
//

import Foundation
import SwiftUI

public struct ColumnsLayout: Layout {
    let columnsNumber: Int
    let equalWidths: Bool
    
    public init(columnsNumber: Int = 2, equalWidths: Bool = true) {
        guard columnsNumber > 0 else {
            fatalError("columnsNumber must be above zero")
        }
        self.columnsNumber = columnsNumber
        self.equalWidths = equalWidths
    }
    
    func getSubviewProposal(subviewsCount: Int, from globalProposal: ProposedViewSize) -> ProposedViewSize {
        let rowHeight = max(ceil(Double(subviewsCount / columnsNumber)), 1)
        return ProposedViewSize(
            width: (globalProposal.width ?? 0)
                            / CGFloat(columnsNumber),
            height: (globalProposal.height ?? 0) / rowHeight
        )
    }
    
    /**
     Get array of heights for every row.
     Just get max height on every row
     */
    private func getRowHeights(subviews: Subviews, subviewProposal: ProposedViewSize) -> [CGFloat] {
        var subviewProposalNoHLimit = subviewProposal
        subviewProposalNoHLimit.height = .infinity
        
        var rowHeights = [CGFloat]()
        var index = 0
        while index < subviews.count {
            var rowMax: CGFloat = 0
            for _ in 0..<columnsNumber where index < subviews.count {
                let size = subviews[index].sizeThatFits(subviewProposalNoHLimit)
                rowMax = max(rowMax, size.height)
                index += 1
            }
            rowHeights.append(rowMax)
        }
        return rowHeights
    }
    
    public func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        let subviewProposal = getSubviewProposal(
            subviewsCount: subviews.count,
            from: proposal
        )
        let rowHeights = getRowHeights(subviews: subviews, subviewProposal: subviewProposal)
        return CGSize(
            width: proposal.width ?? ((subviewProposal.width ?? 0) * CGFloat(columnsNumber)),
            height: rowHeights.reduce(0, +)
        )
    }
    
public func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
) {
    var subviewProposal = getSubviewProposal(
        subviewsCount: subviews.count,
        from: proposal
    )
    let colRealWidth = subviewProposal.width ?? 0
    let rowHeights = getRowHeights(subviews: subviews, subviewProposal: subviewProposal)
    
    var curPos: CGFloat = bounds.minX
    var curHeight: CGFloat = bounds.minY
    
    var rowIndex = 0
    for (index, subview) in subviews.enumerated() {
        subviewProposal.height = rowHeights[rowIndex]
        let size = subview.dimensions(in: subviewProposal)
        subview.place(
            at: CGPoint(x: curPos, y: curHeight),
            anchor: .topLeading,
            proposal: subviewProposal
        )
        if equalWidths {
            curPos += colRealWidth
        } else {
            curPos += size.width
        }
        
        if index % columnsNumber == columnsNumber - 1 {
            curPos = bounds.minX
            curHeight += rowHeights[rowIndex]
            rowIndex += 1
        }
    }
}
}

struct ColumnsLayout_Previews: PreviewProvider {
    
    static var previews: some View {
        ColumnsLayout(columnsNumber: 3) {
            VStack {
                Text("That's one view")
                Image(systemName: "tortoise.fill")
            }
            .padding()
            .border(.red)
            Text("That's the second view ")
                .padding()
                .border(.red)
            Text("That's the third view with long lines that are warped automatically")
                .lineLimit(100)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(3)
                .padding()
                .border(.red)
        }
        .border(.blue)
        .padding()
    }
}
