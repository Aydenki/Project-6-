//
//  GreenThree.swift
//  Project 6!
//
//  Created by Loaner on 4/29/23.
//

import SwiftUI

struct GreenThree: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
            Text("\(3)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}

struct GreenThree_Previews: PreviewProvider {
    static var previews: some View {
        GreenThree()
    }
}
