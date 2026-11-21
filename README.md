# DelaCruz Facebook News Feed Activity

## Lab Activity 1 Discussion

This Flutter activity recreates a simplified Facebook-style news feed. The enhancement uses
`Image`, `CircleAvatar`, `InkWell`, `Icon`, `Row`, `Column`, and `ClipRRect` widgets to present
post content, profile images, a post image area, and interactive Like, Comment, and Share areas.

The news feed card is implemented as a stateful widget so that tapping Like updates both the
icon color and like count. Remote images are loaded with `Image.network` and `NetworkImage`,
with fallbacks for missing profile or post images.

## Discussion: Integrating Images in `newsfeed_card.dart` Dynamically

The integration of images into `newsfeed_card.dart` is made dynamic through the `hasImage`, `imageUrl`, and `avatarUrl` properties. The `hasImage` property determines whether an image section should be displayed for each post, while `imageUrl` identifies the post image and `avatarUrl` identifies the profile image. When `hasImage` is `true`, the card inserts a `ClipRRect` containing a sized image widget into the news feed. When `hasImage` is `false`, the image section is skipped through an `if` condition, preventing posts without images from displaying an empty image area. This allows every `NewsFeedCard` instance to decide independently whether it should contain an image.

The card also supports both local and network images. A local image stored under `assets/images/` is loaded with `Image.asset()`, while an online image is loaded with `Image.network()`. The implementation checks whether `imageUrl` begins with `assets/`; if it does, it uses the local asset, and otherwise it uses the network URL. The profile image in `CircleAvatar` works similarly by using `AssetImage` for a local path and `NetworkImage` for an internet URL. If no avatar is supplied, the card displays a fallback person icon instead. Local assets must be declared under the `flutter` section of `pubspec.yaml`, and network images require an internet connection. This approach makes the image handling reusable, flexible, and suitable for both image and non-image posts.
