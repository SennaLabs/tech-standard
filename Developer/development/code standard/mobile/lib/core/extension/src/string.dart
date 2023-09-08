part of '../extensions.dart';

extension StringExtension on String? {
  bool get isNullOrEmpty {
    return this == null ||
        (this != null && this!.isEmpty) ||
        (this != null && this!.contains("null"));
  }

  String get handleOverflow => '$this'.replaceAll('', '\u200B');

  String? get isEmptyHtml {
    String? textFormReplaceBlank = this?.replaceAll('&nbsp;', '');
    final document = html_parser.parseFragment(textFormReplaceBlank);
    return document.text?.replaceAll(' ', '');
  }

  String? onLimitText({required int limit}) {
    return this!.length > limit ? this?.substring(0, limit) : this;
  }

  String? onAddSpachHtml({String? fontFamily}) {
    String? resultStrong = this?.replaceAll('<p><strong>', '<p><strong class="indentStyle">');

    switch (fontFamily) {
      case 'JsJindara':
        return resultStrong?.replaceAll('<p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');

      default:
        return resultStrong?.replaceAll(
            '<p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
    }
  }

  String? replaceParagraph() {
    return this?.replaceAll('<p></p>', '<p> </p>').replaceAll('<p>', '<p><indent></indent>');
  }

  String? replaceMark() {
    return this?.replaceAll('mark', 'span');
  }

  String onHandleError({required String? message}) {
    return message ?? "There's something wrong.";
  }

  String onHandleString({required dynamic str, required dynamic start, required dynamic end}) {
    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);
    return str.substring(startIndex + start.length, endIndex);
  }

  String replaceHtml({required String html}) {
    // set color red
    final resultColor =
    html.replaceAll("style='color: red;'", 'class="redText" style="color: red;"');

    // text-align to left (topic of table)
    final tablePadding =
    resultColor.replaceAll("style='margin-bottom: 10px;margin-left: 50px;'", '');

    // text-align to left (body of table)
    final bodySpace =
    tablePadding.replaceAll("</td><td style='padding: 5px", "</td>  <td style='padding: 5px");

    // remove margin
    final resultMargin = bodySpace.replaceAll("style='margin-left: 50px;'", '');

    String? resultStrong =
    resultMargin.replaceAll('<p><strong>', '<p><strong class="indentStyle">');

    return resultStrong;
  }

  String get withFormatEmojis {
    if (this == null || (this ?? "").isEmpty) return "";

    final regexEmoji = RegExp(
        r'(\u21A9-\u21AA\u231A-\u231B\u23CF\u23E9-\u23F3\u23F8-\u23FA\u24C2\u25AA-\u25AB\u25B6\u25C0\u25FB-\u25FE\u2600-\u260E\u2614-\u261D\u2622-\u262A\u262E-\u262F\u2638-\u263A\u2648-\u2665-\u267B\u267F\u2692-\u269B-\u269C\u26A0-\u26A1\u26AA-\u26AB\u26B0-\u26B1\u26BD-\u26BE\u26C4-\u26C5\u26C8\u26CE-\u26CF\u26D1\u26D3-\u26D4\u26E9-\u26EA\u26F0-\u26F5\u26F7-\u26FA\u26FD\u2708-\u270D\u270F\u271D\u274C\u274E\u2753-\u2763-\u2795-\u27B0\u27BF\u2934-\u2B05-\u2B07\u2B1B-\u2B1C\u2B50\u2B55\u3030\u303D\uD83C[\uDC04\uDCCF\uDD70-\uDD71\uDD7E-\uDD7F\uDD8E\uDD91-\uDD9A\uDDE6-\uDDFF\uDE01-\uDE02\uDE1A\uDE2F\uDE32-\uDE3A\uDE50-\uDE51\uDF00-\uDF21\uDF24-\uDF93\uDF96-\uDF97\uDF99-\uDF9B\uDF9E-\uDFF0\uDFF3-\uDFF5\uDFF7-\uDFFF]|\uD83D[\uDC00-\uDCFD\uDCFF-\uDD3D\uDD49-\uDD4E\uDD50-\uDD67\uDD6F-\uDD70\uDD73-\uDD7A\uDD87\uDD8A-\uDD8D\uDD90\uDD95-\uDD96\uDDA4-\uDDA5\uDDA8\uDDB1-\uDDB2\uDDBC\uDDC2-\uDDC4\uDDD1-\uDDD3\uDDDC-\uDDDE\uDDE1\uDDE3\uDDE8\uDDEF\uDDF3\uDDFA-\uDE4F\uDE80-\uDEC5\uDECB-\uDED2\uDEE0-\uDEE5\uDEE9\uDEEB-\uDEEC\uDEF0\uDEF3-\uDEF6]|\uD83E[\uDD10-\uDD1E\uDD20-\uDD27\uDD30\uDD33-\uDD3A\uDD3C-\uDD3E\uDD40-\uDD45\uDD47-\uDD4B\uDD50-\uDD5E\uDD80-\uDD91\uDDC0\u00a9|\u00ae|\u203C|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

    if (regexEmoji.hasMatch(this!)) {
      return this!;
    } else {
      return this!.replaceAll("", "\u200B");
    }
  }
}