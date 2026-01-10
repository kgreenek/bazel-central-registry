"""Used to generate config flags that control settings in the generated folly-config.h file."""

load("@bazel_skylib//rules:common_settings.bzl", "bool_flag")

def folly_define_flag(name, define):
    """Defines a flag for the folly-conifg.h file.

    Declares:
      - a bool build setting :<name> (default False)
      - a config_setting :<name>_setting that matches when the flag is true

    Returns:
      a label string for the _setting config_setting and the define name.
    """
    bool_flag(
        name = name,
        build_setting_default = False,
        visibility = ["//visibility:public"],
    )
    config_setting(
        name = name + "_setting",
        flag_values = {":" + name: "true"},
        visibility = ["//visibility:public"],
    )
    return (":" + name + "_setting", define)
