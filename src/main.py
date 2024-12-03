import pygfx as gfx
import pylinalg as la
from imgui_bundle import imgui
from wgpu.gui.auto import WgpuCanvas
from wgpu.utils.imgui import ImguiRenderer

canvas = WgpuCanvas(size=(1280, 720), title="Pygfx & ImGui", max_fps=120)
renderer = gfx.renderers.WgpuRenderer(canvas)

imgui_renderer = ImguiRenderer(renderer.device, canvas)

cube = gfx.Mesh(
    gfx.box_geometry(200, 200, 200),
    gfx.MeshPhongMaterial(color="#336699", shininess=0),
)


def update_gui():
    imgui.new_frame()

    imgui.begin("Custom Window", None)
    imgui.text("Lorem ipsum dolor sit amet")
    if imgui.button("Click me!"):
        print("Button clicked")

    imgui.show_demo_window()

    imgui.end()

    imgui.end_frame()
    imgui.render()

    return imgui.get_draw_data()


imgui_renderer.set_gui(update_gui)


def animate():
    rot = la.quat_from_euler((0.005, 0.01), order="XY")
    cube.local.rotation = la.quat_mul(rot, cube.local.rotation)


if __name__ == "__main__":
    gfx.show(
        object=cube,
        renderer=renderer,
        before_render=animate,
        after_render=imgui_renderer.render,
    )
