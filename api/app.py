from flask import Flask, request, jsonify

app = Flask(__name__)

def is_palindrome(text):
    """Check if the given text is a pure palindrome (ignoring spaces and punctuation)."""
    cleaned_text = ''.join(char.lower() for char in text if char.isalnum())
    return cleaned_text == cleaned_text[::-1]

def is_pure_palindrome(text):
    """Check if the given text is a palindrome."""
    return text == text[::-1]

@app.route('/palindrome', methods=['POST'])
def check_palindromes():
    data = request.get_json()

    if not isinstance(data, list):
        return jsonify({"error": "Invalid data format. Expected a list."}), 400

    results = []
    for text in data:
        results.append({
            "text": text,
            "is_pure_palindrome": is_pure_palindrome(text),
            "is_palindrome": is_palindrome(text)
        })

    return jsonify(results)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
