load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")

def plantuml_rules_dependencies():
    _maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        ],
        sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
    )

    _maybe(
        http_jar,
        name = "plantuml",
        url = "https://deac-ams.dl.sourceforge.net/project/plantuml/1.2020.18/plantuml.1.2020.18.jar",
        sha256 = "a6e2b64a9207acb14f6f587f6e264fbe5e0fffa8cf645eadfe640abc9c9ac1ca",
    )

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
