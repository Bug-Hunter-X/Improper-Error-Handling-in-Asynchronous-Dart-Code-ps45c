```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData
      // You might want to return jsonData here for further processing
    } else {
      // More robust error handling
      throw Exception('Failed to load data. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } on SocketException catch (e) {
    // Handle network errors specifically
    print('Network error: $e');
     // Consider showing an error message to the user or retrying the request.
  } on FormatException catch (e) {
    // Handle JSON decoding errors specifically
    print('JSON decoding error: $e');
     // Log the error and display a user-friendly message.
  } catch (e) {
    // Handle other exceptions
    print('Unexpected error: $e');
     // Log the unexpected error, potentially with additional context.
  }
}
```