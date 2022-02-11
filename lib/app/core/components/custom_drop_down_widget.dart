import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/styles/app_colors.dart';

const Duration _kDropdownMenuDuration = Duration(milliseconds: 300);
const double _kMenuItemHeight = 48.0;
const double _kDenseButtonHeight = 24.0;
const EdgeInsets _kMenuItemPadding = EdgeInsets.symmetric(horizontal: 16.0);
const EdgeInsetsGeometry _kAlignedButtonPadding =
    EdgeInsetsDirectional.only(start: 16.0, end: 4.0);
const EdgeInsets _kUnalignedButtonPadding = EdgeInsets.zero;
const EdgeInsets _kAlignedMenuMargin = EdgeInsets.zero;
const EdgeInsetsGeometry _kUnalignedMenuMargin =
    EdgeInsetsDirectional.only(start: 16.0, end: 24.0);

class _DropdownMenuPainter extends CustomPainter {
  _DropdownMenuPainter({
    required this.color,
    required this.elevation,
    required this.selectedIndex,
    required this.resize,
  })  : _painter = BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2.0),
                boxShadow: kElevationToShadow[elevation])
            .createBoxPainter(),
        super(repaint: resize);

  final Color color;
  final int elevation;
  final int selectedIndex;
  final Animation<double> resize;

  final BoxPainter _painter;

  @override
  void paint(Canvas canvas, Size size) {
    final double selectedItemOffset =
        selectedIndex * _kMenuItemHeight + kMaterialListPadding.top;
    final Tween<double> top = Tween<double>(
      begin: selectedItemOffset.clamp(0.0, size.height - _kMenuItemHeight),
      end: 0.0,
    );

    final Tween<double> bottom = Tween<double>(
      begin: (top.begin ?? 0 + _kMenuItemHeight)
          .clamp(_kMenuItemHeight, size.height),
      end: size.height,
    );

    final Rect rect = Rect.fromLTRB(
      0.0,
      top.evaluate(resize),
      size.width,
      bottom.evaluate(resize),
    );

    _painter.paint(
      canvas,
      rect.topLeft,
      ImageConfiguration(size: rect.size),
    );
  }

  @override
  bool shouldRepaint(_DropdownMenuPainter oldPainter) {
    return oldPainter.color != color ||
        oldPainter.elevation != elevation ||
        oldPainter.selectedIndex != selectedIndex ||
        oldPainter.resize != resize;
  }
}

class _DropdownScrollBehavior extends ScrollBehavior {
  const _DropdownScrollBehavior();

  @override
  TargetPlatform getPlatform(BuildContext context) =>
      Theme.of(context).platform;

  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}

class _DropdownMenu<T> extends StatefulWidget {
  _DropdownMenu(
      {Key? key,
      required this.padding,
      this.customPaddingOfCard,
      required this.route,
      this.onPressed})
      : super(key: key);

  final _DropdownRoute<T> route;
  final EdgeInsets padding;
  final EdgeInsets? customPaddingOfCard;
  void Function()? onPressed;

  @override
  _DropdownMenuState<T> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<_DropdownMenu<T>> {
  late CurvedAnimation _fadeOpacity;
  late CurvedAnimation _resize;

  @override
  void initState() {
    super.initState();
    _fadeOpacity = CurvedAnimation(
      parent: widget.route.animation!,
      curve: const Interval(0.0, 0.25),
      reverseCurve: const Interval(0.75, 1.0),
    );
    _resize = CurvedAnimation(
      parent: widget.route.animation!,
      curve: const Interval(0.25, 0.5),
      reverseCurve: const Threshold(0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final _DropdownRoute<T> route = widget.route;
    final double unit = 0.5 / (route.items.length + 1.5);
    final List<Widget> children = <Widget>[];
    for (int itemIndex = 0; itemIndex < route.items.length; ++itemIndex) {
      CurvedAnimation opacity;
      if (itemIndex == route.selectedIndex) {
        opacity = CurvedAnimation(
          parent: route.animation!,
          curve: const Threshold(0.0),
        );
      } else {
        final double start = (0.5 + (itemIndex + 1) * unit).clamp(0.0, 1.0);
        final double end = (start + 1.5 * unit).clamp(0.0, 1.0);
        opacity = CurvedAnimation(
          parent: route.animation!,
          curve: Interval(start, end),
        );
      }
      children.add(FadeTransition(
        opacity: opacity,
        child: InkWell(
          onTap: () => Navigator.pop(
            context,
            _DropdownRouteResult<T>(route.items[itemIndex].value!),
          ),
          child: Container(
            padding: widget.padding,
            child: route.items[itemIndex],
          ),
        ),
      ));
    }
    Widget scrollConfig = ScrollConfiguration(
      behavior: const _DropdownScrollBehavior(),
      child: Scrollbar(
        child: ListView(
          controller: widget.route.scrollController,
          padding: kMaterialListPadding,
          shrinkWrap: true,
          children: children,
        ),
      ),
    );
    return FadeTransition(
      opacity: _fadeOpacity,
      child: Container(
        margin: EdgeInsets.only(top: 12),
        padding: _kMenuItemPadding,
        child: Semantics(
          scopesRoute: true,
          namesRoute: true,
          explicitChildNodes: true,
          label: localizations.popupMenuLabel,
          child: Material(
            elevation: 3,
            color: Color(0xff44454E),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            textStyle: route.style,
            child: widget.onPressed == null
                ? scrollConfig
                : Container(
                    height: 300,
                    child: Stack(
                      children: [
                        scrollConfig,
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.lightBlue,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Container(
                              width: double.infinity,
                              child: TextButton(
                                child: Text("GERENCIAR EXERCICIOS",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600)),
                                onPressed: widget.onPressed,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _DropdownMenuRouteLayout<T> extends SingleChildLayoutDelegate {
  _DropdownMenuRouteLayout({
    required this.buttonRect,
    required this.menuTop,
    required this.menuHeight,
    required this.textDirection,
  });

  final Rect buttonRect;
  final double menuTop;
  final double menuHeight;
  final TextDirection textDirection;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final double maxHeight =
        math.max(0.0, constraints.maxHeight - 2 * _kMenuItemHeight);
    final double width = math.min(constraints.maxWidth, buttonRect.width);
    return BoxConstraints(
      minWidth: width,
      maxWidth: width,
      maxHeight: maxHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    assert(() {
      final Rect container = Offset.zero & size;
      if (container.intersect(buttonRect) == buttonRect) {
        assert(menuTop >= 0.0);
        assert(menuTop + menuHeight <= size.height);
      }
      return true;
    }());
    double left;
    switch (textDirection) {
      case TextDirection.rtl:
        left = buttonRect.right.clamp(0.0, size.width) - childSize.width;
        break;
      case TextDirection.ltr:
        left = buttonRect.left.clamp(0.0, size.width - childSize.width);
        break;
    }
    return Offset(left, menuTop);
  }

  @override
  bool shouldRelayout(_DropdownMenuRouteLayout<T> oldDelegate) {
    return buttonRect != oldDelegate.buttonRect ||
        menuTop != oldDelegate.menuTop ||
        menuHeight != oldDelegate.menuHeight ||
        textDirection != oldDelegate.textDirection;
  }
}

class _DropdownRouteResult<T> {
  const _DropdownRouteResult(this.result);

  final T result;

  @override
  bool operator ==(dynamic other) {
    if (other is! _DropdownRouteResult<T>) {
      return false;
    }
    final _DropdownRouteResult<T> typedOther = other;
    return result == typedOther.result;
  }

  @override
  int get hashCode => result.hashCode;
}

class _DropdownRoute<T> extends PopupRoute<_DropdownRouteResult<T>> {
  _DropdownRoute({
    required this.items,
    required this.padding,
    required this.buttonRect,
    required this.selectedIndex,
    required this.theme,
    required this.style,
    this.onPressed,
    required this.barrierLabel,
    this.elevation = 8,
  });

  final List<DropdownMenuItem<T>> items;
  final EdgeInsetsGeometry padding;
  final Rect buttonRect;
  final int selectedIndex;
  final int elevation;
  final ThemeData theme;
  final TextStyle style;
  void Function()? onPressed;

  ScrollController? scrollController;

  @override
  Duration get transitionDuration => _kDropdownMenuDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => null;

  @override
  final String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    assert(debugCheckHasDirectionality(context));
    final double screenHeight = MediaQuery.of(context).size.height;
    final double maxMenuHeight = screenHeight - 2.0 * _kMenuItemHeight;
    final double preferredMenuHeight =
        (items.length * _kMenuItemHeight) + kMaterialListPadding.vertical;
    final double menuHeight = math.min(maxMenuHeight, preferredMenuHeight);

    final double buttonTop = buttonRect.top;
    final double selectedItemOffset =
        selectedIndex * _kMenuItemHeight + kMaterialListPadding.top;
    double menuTop = (buttonTop - selectedItemOffset) -
        (_kMenuItemHeight - buttonRect.height) / 2.0;
    const double topPreferredLimit = _kMenuItemHeight;
    if (menuTop < topPreferredLimit) {
      menuTop = math.min(buttonTop, topPreferredLimit);
    }
    double bottom = menuTop + menuHeight;
    final double bottomPreferredLimit = screenHeight - _kMenuItemHeight;
    if (bottom > bottomPreferredLimit) {
      bottom = math.max(buttonTop + _kMenuItemHeight, bottomPreferredLimit);
      menuTop = bottom - menuHeight;
    }

    if (scrollController == null) {
      double scrollOffset = 0.0;
      if (preferredMenuHeight > maxMenuHeight) {
        scrollOffset = selectedItemOffset - (buttonTop - menuTop);
      }
      scrollController = ScrollController(initialScrollOffset: scrollOffset);
    }

    final TextDirection textDirection = Directionality.of(context);
    Widget menu = _DropdownMenu<T>(
      route: this,
      onPressed: onPressed,
      padding: padding.resolve(textDirection),
    );

    menu = Theme(data: theme, child: menu);

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: Builder(
        builder: (BuildContext context) {
          return CustomSingleChildLayout(
            delegate: _DropdownMenuRouteLayout<T>(
              buttonRect: buttonRect,
              menuTop: menuTop,
              menuHeight: menuHeight,
              textDirection: textDirection,
            ),
            child: menu,
          );
        },
      ),
    );
  }

  void _dismiss() {
    navigator?.removeRoute(this);
  }
}

class CustomDropdownButton<T> extends StatefulWidget {
  CustomDropdownButton({
    Key? key,
    required this.items,
    this.hint,
    this.onChanged,
    this.style,
    this.elevation = 8,
    this.icon,
    this.prefixIcon,
    this.iconDisabledColor,
    this.margin,
    this.iconEnabledColor,
    this.onClicked,
    this.onPressed,
    this.iconSize = 24.0,
    this.isDense = false,
    this.underline,
    this.value,
    this.dropdownColor,
  })  : assert(value == null ||
            items
                    .where((DropdownMenuItem<T> item) => item.value == value)
                    .length ==
                1),
        super(key: key);
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final Widget? hint;
  final Widget? underline;
  final ValueChanged<T>? onChanged;
  final void Function()? onClicked;
  final int elevation;
  final TextStyle? style;
  final Widget? icon;
  final Widget? prefixIcon;
  final Color? dropdownColor;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final EdgeInsetsGeometry? margin;
  final bool isDense;
  void Function()? onPressed;

  @override
  _DropdownButtonState<T> createState() => _DropdownButtonState<T>();
}

class _DropdownButtonState<T> extends State<CustomDropdownButton<T>>
    with WidgetsBindingObserver {
  int? _selectedIndex;
  _DropdownRoute<T>? _dropdownRoute;

  @override
  void initState() {
    super.initState();
    _updateSelectedIndex();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _removeDropdownRoute();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    _removeDropdownRoute();
  }

  void _removeDropdownRoute() {
    _dropdownRoute?._dismiss();
    _dropdownRoute = null;
  }

  @override
  void didUpdateWidget(CustomDropdownButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    _updateSelectedIndex();
  }

  void _updateSelectedIndex() {
    assert(widget.value == null ||
        widget.items
                .where((DropdownMenuItem<T> item) => item.value == widget.value)
                .length ==
            1);
    _selectedIndex = 0;
    for (int itemIndex = 0; itemIndex < widget.items.length; itemIndex++) {
      if (widget.items[itemIndex].value == widget.value) {
        _selectedIndex = itemIndex;
        return;
      }
    }
  }

  TextStyle get _textStyle =>
      widget.style ?? Theme.of(context).textTheme.subtitle1!;

  void _handleTap() {
    if (widget.onClicked != null) {
      widget.onClicked!();
    }
    final RenderBox itemBox = context.findRenderObject()! as RenderBox;
    final Rect itemRect = itemBox.localToGlobal(Offset.zero) & itemBox.size;
    final TextDirection textDirection = Directionality.of(context);
    final EdgeInsetsGeometry menuMargin =
        ButtonTheme.of(context).alignedDropdown
            ? _kAlignedMenuMargin
            : _kUnalignedMenuMargin;

    assert(_dropdownRoute == null);
    _dropdownRoute = _DropdownRoute<T>(
      items: widget.items,
      onPressed: widget.onPressed,
      buttonRect: menuMargin.resolve(textDirection).inflateRect(itemRect),
      padding: _kMenuItemPadding.resolve(textDirection),
      selectedIndex: -1,
      elevation: widget.elevation,
      theme: Theme.of(context),
      style: _textStyle,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    );

    Navigator.push(context, _dropdownRoute!)
        .then<void>((_DropdownRouteResult<T>? newValue) {
      _dropdownRoute = null;
      if (!mounted || newValue == null) {
        return;
      }
      if (widget.onChanged != null) {
        widget.onChanged!(newValue.result);
      }
    });
  }

  double get _denseButtonHeight {
    return math.max(
        _textStyle.fontSize!, math.max(widget.iconSize, _kDenseButtonHeight));
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    final List<Widget> items = List<Widget>.from(widget.items);
    int? hintIndex;
    if (widget.hint != null) {
      hintIndex = items.length;
      items.add(DefaultTextStyle(
        style: _textStyle.copyWith(
          color: Theme.of(context).hintColor,
        ),
        child: IgnorePointer(
          ignoringSemantics: false,
          child: widget.hint,
        ),
      ));
    }

    final EdgeInsetsGeometry padding = ButtonTheme.of(context).alignedDropdown
        ? _kAlignedButtonPadding
        : _kUnalignedButtonPadding;

    Widget result = DefaultTextStyle(
      style: _textStyle,
      child: Container(
        padding: padding.resolve(Directionality.of(context)),
        height: widget.isDense ? _denseButtonHeight : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              children: [
                Offstage(
                  offstage: widget.prefixIcon == null,
                  child: widget.prefixIcon,
                ),
                widget.value == null
                    ? widget.hint!
                    : IndexedStack(
                        index: _selectedIndex ?? hintIndex,
                        alignment: AlignmentDirectional.centerStart,
                        children: items,
                      ),
              ],
            ),
            IconTheme(
              data: IconThemeData(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70,
                size: widget.iconSize,
              ),
              child: widget.icon ??
                  const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.white),
            ),
          ],
        ),
      ),
    );

    if (!DropdownButtonHideUnderline.at(context)) {
      final double bottom = widget.isDense ? 0.0 : 8.0;
      result = Stack(
        children: <Widget>[
          result,
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: bottom,
            child: widget.underline ??
                Container(
                  height: 1.0,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide.none)),
                ),
          ),
        ],
      );
    }

    return Semantics(
      button: true,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: _handleTap,
          behavior: HitTestBehavior.opaque,
          child: result,
        ),
      ),
    );
  }
}
