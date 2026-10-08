import CoreGraphics

/// Spacing scale on an 8 pt rhythm, from the Figma `Spacing` collection.
///
/// Figma `space/2xl` is `Spacing.xxl`, because a Swift name cannot start
/// with a digit.
public enum Spacing {
    /// `space/xs`, 4 pt.
    public static let xs: CGFloat = 4
    /// `space/sm`, 8 pt.
    public static let sm: CGFloat = 8
    /// `space/md`, 16 pt. Also the screen margin.
    public static let md: CGFloat = 16
    /// `space/lg`, 24 pt.
    public static let lg: CGFloat = 24
    /// `space/xl`, 32 pt.
    public static let xl: CGFloat = 32
    /// `space/2xl`, 48 pt.
    public static let xxl: CGFloat = 48
}
