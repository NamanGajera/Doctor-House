import 'package:doctor_house/bloc/appThemeBloc/app_theme_bloc.dart';
import 'package:doctor_house/bloc/appThemeBloc/app_theme_event.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ThemeChangeScreen extends StatelessWidget {
  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<AppThemeBloc>();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: themeBloc.darkTheme ? Colors.white : Colors.black,
              ).onTap(() {
                context.pop();
              }),
              SizedBox(width: 20),
              Text(
                'Theme',
                style: Theme.of(context).textTheme.headlineSmall,
              ).centered(),
            ],
          ).withPadding(EdgeInsets.symmetric(horizontal: 12, vertical: 5)),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your style',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Select your preferred theme mode',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
                const SizedBox(height: 30),
                _buildDividerWithText(context, 'APPEARANCE'),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).dividerColor.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return RotationTransition(
                                turns: animation,
                                child: ScaleTransition(
                                  scale: animation,
                                  child: child,
                                ),
                              );
                            },
                            child: Icon(
                              themeBloc.darkTheme ? Icons.dark_mode : Icons.light_mode,
                              key: ValueKey(themeBloc.darkTheme),
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                child: Text(
                                  themeBloc.darkTheme ? 'Dark Mode' : 'Light Mode',
                                ),
                              ),
                              Text(
                                themeBloc.darkTheme ? 'Easier on your eyes in low light' : 'Classic bright theme',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomAnimatedSwitch(
                        value: themeBloc.darkTheme,
                        onChanged: (value) {
                          context.read<AppThemeBloc>().add(ToggleThemeEvent());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDividerWithText(BuildContext context, String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 1,
            color: Theme.of(context).dividerColor.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}

class CustomAnimatedSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomAnimatedSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomAnimatedSwitch> createState() => _CustomAnimatedSwitchState();
}

class _CustomAnimatedSwitchState extends State<CustomAnimatedSwitch> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: widget.value ? 1.0 : 0.0,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(CustomAnimatedSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: 64,
            height: 32,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  widget.value
                      ? const Color(0xFF6B63FF) // Dark mode start color
                      : const Color(0xFFFFB74D), // Light mode start color
                  widget.value
                      ? const Color(0xFF8A84FF) // Dark mode end color
                      : const Color(0xFFFFCC80), // Light mode end color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.value ? const Color(0xFF6B63FF).withOpacity(0.3) : const Color(0xFFFFB74D).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Track highlight
                AnimatedOpacity(
                  opacity: widget.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF8A84FF),
                          Color(0xFF6B63FF),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                // Thumb
                Transform.translate(
                  offset: Offset(_animation.value * 32, 0),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          widget.value ? Icons.dark_mode : Icons.light_mode,
                          key: ValueKey(widget.value),
                          size: 16,
                          color: widget.value ? const Color(0xFF6B63FF) : const Color(0xFFFFB74D),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
