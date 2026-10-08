import CoreGraphics

/// Corner radii from the Figma `Radius` collection. Corners are concentric:
/// an inner radius is the outer radius minus the inset.
public enum Radius {
    /// `radius/sm`, 8 pt.
    public static let sm: CGFloat = 8
    /// `radius/md`, 12 pt.
    public static let md: CGFloat = 12
    /// `radius/lg`, 18 pt.
    public static let lg: CGFloat = 18
    /// `radius/xl`, 28 pt.
    public static let xl: CGFloat = 28
    /// `radius/full`, 999 pt. Capsules for controls only; prefer `Capsule()`
    /// where a shape is enough.
    public static let full: CGFloat = 999
}
