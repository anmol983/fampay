class CardEntity {
  final String text;
  final String type;
  final String? color;
  final double? fontSize;
  final String? fontStyle;
  final String? fontFamily;

  CardEntity({
    required this.text,
    required this.type,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.fontFamily,
  });

  factory CardEntity.fromJson(Map<String, dynamic> json) {
    return CardEntity(
      text: json['text'],
      type: json['type'],
      color: json['color'],
      fontSize: json['font_size']?.toDouble(),
      fontStyle: json['font_style'],
      fontFamily: json['font_family'],
    );
  }
}

class FormattedTitle {
  final String text;
  final String align;
  final List<CardEntity> entities;

  FormattedTitle({
    required this.text,
    required this.align,
    required this.entities,
  });

  factory FormattedTitle.fromJson(Map<String, dynamic> json) {
    return FormattedTitle(
      text: json['text'],
      align: json['align'],
      entities: (json['entities'] as List)
          .map((e) => CardEntity.fromJson(e))
          .toList(),
    );
  }
}

class Card {
  final int id;
  final String name;
  final String slug;
  final String? title;
  final FormattedTitle? formattedTitle;
  final String? description;
  final FormattedTitle? formattedDescription;
  final List<dynamic> positionalImages;
  final List<dynamic> components;
  final String? url;
  final Map<String, dynamic>? bgImage;
  final Map<String, dynamic>? bgGradient;
  final Map<String, dynamic>? icon;
  final List<dynamic>? cta;
  final bool isDisabled;
  final bool isShareable;
  final bool isInternal;
  final String? bgColor;
  final int? iconSize;

  Card({
    required this.id,
    required this.name,
    required this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    required this.positionalImages,
    required this.components,
    this.url,
    this.bgImage,
    this.bgGradient,
    this.icon,
    this.cta,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
    this.bgColor,
    this.iconSize,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      title: json['title'],
      formattedTitle: json['formatted_title'] != null
          ? FormattedTitle.fromJson(json['formatted_title'])
          : null,
      description: json['description'],
      formattedDescription: json['formatted_description'] != null
          ? FormattedTitle.fromJson(json['formatted_description'])
          : null,
      positionalImages: json['positional_images'] ?? [],
      components: json['components'] ?? [],
      url: json['url'],
      bgImage: json['bg_image'],
      bgGradient: json['bg_gradient'],
      icon: json['icon'],
      cta: json['cta'],
      isDisabled: json['is_disabled'],
      isShareable: json['is_shareable'],
      isInternal: json['is_internal'],
      bgColor: json['bg_color'],
      iconSize: json['icon_size'],
    );
  }
}

class HcGroup {
  final int id;
  final String name;
  final String designType;
  final int cardType;
  final List<Card> cards;
  final bool isScrollable;
  final int height;
  final bool isFullWidth;
  final String slug;
  final int level;

  HcGroup({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.cards,
    required this.isScrollable,
    required this.height,
    required this.isFullWidth,
    required this.slug,
    required this.level,
  });

  factory HcGroup.fromJson(Map<String, dynamic> json) {
    return HcGroup(
      id: json['id'],
      name: json['name'],
      designType: json['design_type'],
      cardType: json['card_type'],
      cards: (json['cards'] as List).map((e) => Card.fromJson(e)).toList(),
      isScrollable: json['is_scrollable'],
      height: json['height'],
      isFullWidth: json['is_full_width'],
      slug: json['slug'],
      level: json['level'],
    );
  }
}

class ApiResponse {
  final int id;
  final String slug;
  final String? title;
  final FormattedTitle? formattedTitle;
  final String? description;
  final FormattedTitle? formattedDescription;
  final dynamic assets;
  final List<HcGroup> hcGroups;

  ApiResponse({
    required this.id,
    required this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    this.assets,
    required this.hcGroups,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      formattedTitle: json['formatted_title'] != null
          ? FormattedTitle.fromJson(json['formatted_title'])
          : null,
      description: json['description'],
      formattedDescription: json['formatted_description'] != null
          ? FormattedTitle.fromJson(json['formatted_description'])
          : null,
      assets: json['assets'],
      hcGroups:
          (json['hc_groups'] as List).map((e) => HcGroup.fromJson(e)).toList(),
    );
  }
}
