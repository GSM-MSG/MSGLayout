protocol Transformable {
    func transform(_ modifier: (inout Self) -> Void) -> Self
}

extension Transformable {
    func transform(_ modifier: (inout Self) -> Void) -> Self {
        var new = self
        modifier(&new)
        return new
    }
}
