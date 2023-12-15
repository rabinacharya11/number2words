/// [LanguageNamingSystem] will be responsible for customizing how the words 
/// will be used while coverting in the language 
/// This will be applicable for a few languages like [nepali], [hindi]
/// 
///  In case of [nepali], Words can be written in two ways: 
/// 1. [roman] :Three Arba Three Crores Three Lakhs Thirty-three thousands three hundered thirty Three Only
/// 2. [native] : तेत्तिस करोड तेत्तिस लाख तेत्तिस हजार तिन सय तेत्तिस

enum LanguageNamingSystem {
  native,
  international,
}
