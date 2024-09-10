struct MovieItemView: View {

    @State var movie: Movie
    @State var isLoading: Bool = true

    var body: some View {
        VStack {
            ImageDownloader
                .shared
                .download(movie, completion: { isLoading = false })
                .redacted(reason: isLoading ? .placeholder : .invalidated)
                .frame(width: 150, height: 225)
                .shadow(radius: 4)
                .background(Color.gray.opacity(0.25))
                .clipShape(RoundedRectangle(cornerRadius: 8.0))

            Text(movie.title)
                .multilineTextAlignment(.center)
                .font(Font.system(size: 12))
                .fontWeight(.bold)
                .frame(width: 150)
                .redacted(reason: isLoading ? .placeholder : .invalidated)
                .padding(.top, 2)

            Text(Formatter.shared.format(movie.releaseDate))
                .multilineTextAlignment(.center)
                .font(Font.system(size: 10))
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
                .frame(width: 150)
                .redacted(reason: isLoading ? .placeholder : .invalidated)
        }
    }
}