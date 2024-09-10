import SwiftUI

struct MovieItemView: View {

    @State var movie: Movie
    @State var isLoading: Bool = true
    @State var width: CGFloat = (UIScreen.main.bounds.width - 137)
    @State var height: CGFloat = 224
    @State var orientation: UIDeviceOrientation = UIDevice.current.orientation

    var body: some View {
        VStack {
            ImageDownloader
                .shared
                .download(poster: movie, completion: { isLoading = false })
                .redacted(reason: isLoading ? .placeholder : .invalidated)
                .frame(width: width, height: height)
                .shadow(radius: 4)
                .background(Color.gray.opacity(0.25))
                .clipShape(RoundedRectangle(cornerRadius: 8.0))

            Text(movie.title ?? "")
                .multilineTextAlignment(.center)
                .font(Font.system(size: 12))
                .fontWeight(.bold)
                .frame(width: width)
                .redacted(reason: isLoading ? .placeholder : .invalidated)
                .padding(.top, 2)

            Text(Formatter.shared.format(movie.releaseDate ?? ""))
                .multilineTextAlignment(.center)
                .font(Font.system(size: 10))
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
                .frame(width: width)
                .redacted(reason: isLoading ? .placeholder : .invalidated)
        }
        .onAppear {
            self.updateSize()
        }
        .onRotate { orientation in
            self.orientation = orientation
            self.updateSize()
        }
    }

    func updateSize() {
        self.width = 150
        self.height = self.width * 1.5
    }
}
