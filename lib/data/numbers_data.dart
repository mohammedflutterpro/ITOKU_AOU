String romajiNumbers(int number) {
  const romajiList = [
    'ichi', 'ni', 'san', 'shi', 'go', 'roku', 'nana', 'hachi', 'kyuu', 'juu',
    'juu-ichi', 'juu-ni', 'juu-san', 'juu-shi', 'juu-go', 'juu-roku', 'juu-nana', 'juu-hachi', 'juu-kyuu', 'ni-juu',
    'ni-juu-ichi', 'ni-juu-ni', 'ni-juu-san', 'ni-juu-shi', 'ni-juu-go', 'ni-juu-roku', 'ni-juu-nana', 'ni-juu-hachi', 'ni-juu-kyuu', 'san-juu',
    'san-juu-ichi', 'san-juu-ni', 'san-juu-san', 'san-juu-shi', 'san-juu-go', 'san-juu-roku', 'san-juu-nana', 'san-juu-hachi', 'san-juu-kyuu', 'yon-juu',
    'yon-juu-ichi', 'yon-juu-ni', 'yon-juu-san', 'yon-juu-shi', 'yon-juu-go', 'yon-juu-roku', 'yon-juu-nana', 'yon-juu-hachi', 'yon-juu-kyuu', 'go-juu',
    'go-juu-ichi', 'go-juu-ni', 'go-juu-san', 'go-juu-shi', 'go-juu-go', 'go-juu-roku', 'go-juu-nana', 'go-juu-hachi', 'go-juu-kyuu', 'roku-juu',
    'roku-juu-ichi', 'roku-juu-ni', 'roku-juu-san', 'roku-juu-shi', 'roku-juu-go', 'roku-juu-roku', 'roku-juu-nana', 'roku-juu-hachi', 'roku-juu-kyuu', 'nana-juu',
    'nana-juu-ichi', 'nana-juu-ni', 'nana-juu-san', 'nana-juu-shi', 'nana-juu-go', 'nana-juu-roku', 'nana-juu-nana', 'nana-juu-hachi', 'nana-juu-kyuu', 'hachi-juu',
    'hachi-juu-ichi', 'hachi-juu-ni', 'hachi-juu-san', 'hachi-juu-shi', 'hachi-juu-go', 'hachi-juu-roku', 'hachi-juu-nana', 'hachi-juu-hachi', 'hachi-juu-kyuu', 'kyuu-juu',
    'kyuu-juu-ichi', 'kyuu-juu-ni', 'kyuu-juu-san', 'kyuu-juu-shi', 'kyuu-juu-go', 'kyuu-juu-roku', 'kyuu-juu-nana', 'kyuu-juu-hachi', 'kyuu-juu-kyuu', 'hyaku'
  ];

  if (number <= 100) {
    return romajiList[number - 1];
  } else {
    return '$number';  // إذا كان الرقم أكبر من 100 سيتم عرضه كما هو
  }
}