load("//build/kernel/kleaf:kernel.bzl", "kernel_module")

def bcmdhd_591_sdio_module(name, kernel_build, deps = None):
    kernel_module(
        name = name,
        srcs = [
            "//vendor/amlogic/dhd-driver:bcmdhd_101_10_591_srcs",
            "//vendor/amlogic/dhd-driver/sdio_591:Makefile",
        ],
        makefile = ["//vendor/amlogic/dhd-driver/sdio_591:Makefile"],
        deps = deps,
        outs = ["dhd.ko"],
        kernel_build = kernel_build,
    )
