/// [LanguageNamingSystem] will be responsible for customizing how the words
/// will be used while coverting in the language
/// This will be applicable for a few languages like [nepali], [hindi]
///  In case of [nepali], Words can be written in two ways:
/// 1. [international] :Three Arba Three Crores Three Lakhs Thirty-three thousands three hundered thirty Three Only
/// 2. [native] : तेत्तिस करोड तेत्तिस लाख तेत्तिस हजार तिन सय तेत्तिस

enum LanguageNamingSystem {
  /// [native] will be used for languages like [nepali],
  /// [hindi] which have their native form of writing
  native,

  /// [semiNative] means the english form of conversion but in the language style of writing
  /// eg : [One core, One lakh, One thousand, One hundred One Only] in [nepali] and [hindi]

  semiNative,

  /// [international] will be used for languages globally
  international,
}
