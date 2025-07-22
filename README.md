## Pearl Talent Assessment Project

### Features
- Fetches a list of items (mocked for demo purposes)
- Search items by title
- Toggle favorite status for items
- Favorites are persisted locally using shared preferences

### Assumptions
- The item data is mocked in the repository for demonstration. In a real scenario, this would be replaced with an API or database source.
- Each item has a unique string id, a title, a timestamp, and an optional favorite flag and tag.
- The favorite status is stored as a list of item IDs in shared preferences.

### Technical Decisions & Reasoning
- State Management: Chose flutter_bloc for scalable, testable state management. Bloc events and states are clearly separated for maintainability.
- Persistence: Used shared_preferences for simple local storage of favorites, as it fits the requirements and is easy to integrate.
- UI Composition: Widgets are modular (ItemsCard, SearchBar) for reusability and clarity. The home page uses BlocProvider and BlocBuilder for reactive UI updates.
- Error Handling: Bloc emits error states for fetch failures, which are displayed in the UI.
- Code Structure: Follows standard Flutter project structure with clear separation of data, presentation, and business logic.

### How Favorites Work
Tapping the star icon on an item toggles its favorite status.
The favorite state is updated in shared preferences and reflected in the UI immediately.
On app launch, favorite states are loaded and merged with the item list.

### Further Improvements
Replace mock data with a real backend or database.
Add tests for bloc logic and widgets.
Improve error and edge case handling.
Add more item attributes or filtering options.
