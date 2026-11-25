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


## Lab Activity 2: Discussion

### Managing Posts and Notifications Efficiently
Instead of hardcoding 10 separate `NewsFeedCard` widgets and 20 separate `NotificationWidget` blocks directly inside the widget tree, both screens store their items in structured `List<Map<String, ...>>` collections and render them using `ListView.builder` (in `newsfeed_screen.dart`) and `ListView.separated` (in `notifications_screen.dart`). This keeps the code concise, easy to maintain, and performant because Flutter lazily builds only the items currently visible on screen. Each post dynamically assigns its `userName`, `postContent`, `date`, `numLikes`, and `hasImage` flag (controlling whether an image/placeholder section is rendered).

### Accomplishing the Enhancements, Challenges, and Solutions
- **Dynamic AppBar Title & Navigation**: `HomeScreen` tracks `_selectedIndex` across the `PageView` and `BottomNavigationBar` (expanded to 3 tabs: Home, Notifications, and Profile). The `AppBar` dynamically switches its title and styling between the custom app name (`nihub`), `Notifications`, and `Profile`.
- **Custom App Name & Color Palette**: Renamed the app to `nihub` in `main.dart` and `home_screen.dart`, and configured the blue/slate color palette in `constants.dart` (`fbPrimary`, `fbSecondary`, `fbDarkPrimary`, `fbLightPrimary`, `fbTextColorWhite`).
- **Challenges & Solutions**:
  - *Scrolling & Overflow with 20 Notifications*: A static `Column` would overflow vertically once 20 notifications were added. Replacing it with `ListView.separated` and `Divider` resolved vertical overflow, while wrapping the text `Column` inside `NotificationWidget` with `Expanded` prevented horizontal overflow on narrower screens.
  - *State Synchronization*: Keeping the `AppBar` title, `PageView` page, and `BottomNavigationBar` active tab in sync was handled by updating `_selectedIndex` in both `onPageChanged` and `_onTappedBar`.
