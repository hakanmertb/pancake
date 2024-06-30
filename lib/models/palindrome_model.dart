class PalindromeModel {
  String? text;
  bool? isPurePalindrome;
  bool? isPalindrome;

  PalindromeModel({this.text, this.isPurePalindrome, this.isPalindrome});

  PalindromeModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    isPurePalindrome = json['is_pure_palindrome'];
    isPalindrome = json['is_palindrome'];
  }
}
