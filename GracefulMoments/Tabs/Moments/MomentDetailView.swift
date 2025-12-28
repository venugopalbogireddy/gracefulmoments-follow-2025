//
//  MomentDetailView.swift
//  GracefulMoments
//
//  Created by Venugopal Bogireddy on 12/27/25.
//

import SwiftUI
import SwiftData

struct MomentDetailView: View {
    var moment: Moment
    @State private var showConformation = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(DataContainer.self) private var dataContainer

    var body: some View {
        ScrollView {
            contentStack
        }
        .navigationTitle(moment.title)
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button {
                    showConformation = true
                } label: {
                    Image(systemName: "trash")
                }
                .confirmationDialog("Delete Moment", isPresented: $showConformation) {
                    Button("Delete Moment", role: .destructive) {
                        dataContainer.context.delete(moment)
                        try? dataContainer.context.save()
                        dismiss()
                    }
                }  message: {
                    Text("The moment will be permanently deleted. Earned badges won't be removed.")
                }
            }
        }
    }


    private var contentStack: some View {
        VStack(alignment: .leading) {
            Text(moment.timestamp, style: .date)
                .font(.subheadline)
            if !moment.note.isEmpty {
                Text(moment.note)
                    .textSelection(.enabled)
            }
            if let image = moment.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


#Preview {
    NavigationStack {
        MomentDetailView(moment: .imageSample)
            .sampleDataContainer()
    }
}
