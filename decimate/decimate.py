import bpy

decimate_ratio = 0.3
input_path='/blenderpy/decimate/input.obj'
output_path = '/blenderpy/decimate/output.obj'


bpy.ops.object.select_all(action='SELECT')
bpy.ops.object.delete(True)

bpy.ops.import_scene.obj(filepath=input_path)

for item in bpy.context.scene.objects:
    if item.type == 'MESH':
        bpy.context.view_layer.objects.active = bpy.data.objects[item.name]
        bpy.ops.object.modifier_add(type='DECIMATE')
        bpy.context.object.modifiers["Decimate"].ratio = decimate_ratio

bpy.ops.export_scene.obj(filepath=output_path, check_existing=True, filter_glob='*.obj;*.mtl')