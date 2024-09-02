// Download both files into the same directory and make a copy of this template for each project. Adjust the variables and values as needed to override the defaults in this file as needed. In this way you can replace the `Ultimate_Box_Generator.scad` file with a new version without having to track and restore your changes.

// If you want to use any framework variables in calulations you must import them here. If you want to also change the variable you must use a second line below to do that.
wall=wall;
internal_wall=internal_wall;

// Include the framework. You can change the prefix to load from a shared path.
include    <Ultimate_Box_Generator.scad>;

// At this point you can start to adjust builtin varaibles and create your own. There are also some examples of more complex boxes at the end of the file.


// Parts to render. To do more complex operations disable these and manually call make_box() and make_lid() instead.
show_box=true;	// Whether or not to render the box
show_lid=true;	// Whether or not to render the lid. To make open boxes with no lid set `show_lid=false` and `lid_type=5`.

// General Settings
//comp_size_deep = 12; // Depth of compartments
//comp_size_x = 50;	 // Size of compartments, X
//comp_size_y = 35;	 // Size of compartments, Y
//wall = 2.5;		    // Width of wall, see `internal_wall` below for alternate inner wall size.
//repeat_x = 1;		// Number of compartments, X
//repeat_y = 1;		// Number of compartments, Y
//tolerance=.15;      // Tolerance around lid.  If it's too tight, increase this. If it's too loose, decrease it.

// Box Rounding
//box_corner_radius=0; // Add a rounding effect to the corners of the box. Anything over `wall` will cause structure and lid problems.
//box_corner_radius_axis=[true, true, true]; // Apply rounding on [X, Y, Z] Axis
//internal_corner_radius=0; // Add a rounding effect to the inside.
//mesh_corner_radius=0; // Leave a radius around each corner of the mesh. May help with bridges.
//corner_fn=30;

// Suppress individual walls.
//supress_walls_x=[]; // These are the walls running along the X axis. It should be an array of size [repeat_y-1][repeat_x].
//supress_walls_y=[]; // These are the walls running along the Y axis. It should be an array of size [repeat_x-1][repeat_y].
// Example for repeat_x=4, repeat_y=3:
//supress_walls_x=[[1,0,1,1],[0,1,0,1]];
//supress_walls_y=[[1,0,1],[0,1,1],[1,1,1]];
//supress_sides=false; // [X, Y, X, Y] Cutout/supress some sides. this may behave badly with compartments or mesh.
//supress_sides_radius=wall; // Add a rounding to the cutout.
//supress_sides_offset=0; // 0, wall, [X, Y, Z] adjust the coutout in all directions. + to grow, - to shrink
//supress_sides_fn=30;

// Mesh Settings
// To make rounded corners and no mesh use any `mesh_type` > 0 and set `strut_gap` to a high value.
// 0: No mesh, solid wall.
// 1: Single direction mesh.
// 2: Two direction cross mesh at 90 degree angle to eachother.
// 3: Two direction mesh but mirrored around 90 axis instead or rotated 90 degrees.
// 4: Calculate angle across the diagonal of each opening. You will also want to change `strut_gap` to a large number and set `strut_count_min=1`.
// 5: No mesh, empty wall.
// 6: Honycomb. Also set `strut_width=wall/4` and `strut_gap=wall*2`. Too big of a `strut_gap` may fail to print. Other shapes can be generated with `mesh_fn` and reducing `mesh_inset_padding` may help.
//mesh_type=0; // Mesh type, see above.
//mesh_rotation=0; // 0-90 degrees.
//mesh_alt_rotation=mesh_rotation; // Alternate rotation for top and bottom faces.
//mesh_do_sides=true; //[true, true, true, false] Include mesh on each side along axis. [X, Y, X, Y]
//mesh_do_bottom=false; // Include mesh on bottom plate.
//mesh_do_top=true; // Include mesh on top piece.
//mesh_do_interior=false; // Include mesh on inner walls.
//mesh_inset_padding=wall; // Leave some solid material before building strut frame. Anything less then wall/2 will likely fall apart.
//mesh_fn=mesh_type == 6 ? 6 : 40; // Complexity of curves in meshes, increase for smoother curves.
//strut_width=wall*2; // Width of each strut, 0=hollow.
//strut_gap=wall; // Width of the air gap between each strut. 0=fine air gaps.
//strut_count_min=0; // Optinal minimum number of struts regardless of size calulations.
//alt_strut_width=strut_width; // Width of struts going the other direction.
//alt_strut_gap=strut_gap; // Width of gap going the other direction.
//alt_strut_count_min=strut_count_min; // Optional minimum number of struts regardless of size calculations.
//mesh_overflow=0; // Extra rows to add to the mesh. For example in the Honeycomb partial hexegons will be created along the edges.

// Lid Settings
// 0: No Lid. top may be rounded and can cause other rendering changes.
// 1: Lid that slides off in the x direction.
// 2: Lid with a snapped in hinge that rotates open, will make box one wall taller.
// 3: Lid that snaps down onto the box. Also need to change lid_height to around 1.5mm.
// 4: Stackable version of cover 1. The boxes slide into one another. You will need one cover for the last box.
// 5: Oversized lid sits on top and has sides that extend down. (Needs snap support)
// 6: Stacking boxes, will make box 1/2 walls taller.
//lid_type=1; // Lid type, see above.
//has_thumbhole=true; // Add gripping locations for easy opening.
//has_coinslot=false; // Add slot in the top for dropping in components.
//has_snap=true; // Add small ridges or snaps to lids to help keep them closed.
//coinslot_x=20;	// Size in X direction
//coinslot_y=2.5;	// Size in Y direction
//coinslot_corner_radius=0; // rounded coinslot corners if >0; best if less than half the shorter coinslot dimension
//z_tolerance=0;   // Z tolerance can be tweaked separately, to make the top of the sliding lid be flush with the top of the box itself.
//extra_bottom=.15; // Extra bottom wall height to fit type 4 slider.
//hinge_inset=.75; // Size of the hinge connection.
//snap_inset=.25; // Amount of overhang for snaps to snap into place.
//snap_tolerance=tolerance; // You may need to add tolerance around lid and snaps to let them move freely.
//lid_offset=3;		// This is how far away from the box to print the lid
//lid_height=wall*2;  // Height of lid. Must be greater than wall width for a `lid_type=5` lid to work. On Lid 3 is the depth of the inset snap.
//lid_fn=40; // Increese if printing thicker walls.
//lid_alt_offset=false; // Move lid in X instead of Y for printing.

//Internal Structure (You may need to turn off `mesh_do_sides` or `mesh_do_bottom` for good results.)
// You can also use `make_wall()` to manually add your own walls.
// 1: Rounded bottom frame.
// 2: Hexegon bottom frame. (To make this shape perfect set `comp_size_deep` to the width between to edges of the tile and set `comp_size_x` or `comp_size_y` to this: `comp_size_deep / sqrt(3)*2`.
// 3: Rough bottom for make bits sit unevenly. (Partial)
// 4: Verical rounding on corner. Set `internal_size_deep` to `comp_size_deep` and `internal_size_circle` to the shortest `comp_size` for a circle.
// 5: Vertical hexagon. Results may varry.
//internal_type=0; // Internal structure, see above.
//internal_rotate=false; // On lid axis or rotate to opposite.
//internal_size_deep=comp_size_deep/2; // How far into the box to start the internal structure. Should be `comp_size_deep/2` for type 1-2, `wall` for 3, or comp_size_deep for type 4-5.
//internal_size_circle=internal_type==1 ? internal_size_deep : internal_size_deep * 2 / sqrt(3); // Use this calculation, or the shorter comp_size for type 4-5.
//internal_fn=internal_type==1 || internal_type==4 ? 60 : 6; // Complexity of internal curves, may need to increase for larger or smoother curves.
//internal_wall=wall; // Custom size for internal walls.
//internal_wall_deep=comp_size_deep; // If set to lower than comp_size_deep then the internal walls will be this tall.

// Text Settings
// 0: None.
// 1: Cutout. Remove material from the wall.
// 2: Raised. If a mesh is used, part of it is filled in to hold the text. Lids 0 and 3 are printed upside down by default. With this option used they will require supports regardless of the orrientation printed.
//text_type=0; // Text type, see above.
//text_depth=wall/6; // Distance to cutout text or raise it. Use `wall` to cut through.
//text_size=5; // Font Size.
//text_font="Courier New:style=Bold"; // Use Help -> Font List to see options.
//text_message="Red Player"; // Message Text, or use `["Line 1", "Line 2"]` for multiline.
//text_message_compartments=false;//[["AA", "BB", "CC"], ["AB", "BC", "CD"]]; // Custom text for compartments in top or bottom. Also supports multiline as `[[ ["A", "B"] ]]`.
//text_sides=true;//[true, true, true, false]; // Sides to put text on, [X, Y, X, Y]
//text_top=true; // Put Text on the top.
//text_bottom=false; // Put Text on the bottom.
//text_rotation=0; // Rotate the top and bottom text by X degrees. 90 will rotate from the X axis to the Y axis.
//text_offset=0; // Text is verticaly centered in the wall. This may look "off" due to casing or hanging tails. You can manually adjust the vertical alignment with this setting.
//text_fn=30; // Complexity of the letters, may need to increese with larger fonts.
//text_backdrop_scale=[.9, 1.5]; // Font size scaling used on the backdrop when `text_type=2` is used on sides with a mesh.

// Complex Structure
//make_complex_box=false; // Use an array of objects from `complex_box` to create many smaller boxes within the larger box.
//internal_grow_down=true; // If set compartments will be extruded into the larger box from the top to make a flush surface. (May result in a model that uses a lot of material).
//internal_empty_bottom=false; // If set the area blow each box will be empty. This will not be printable on a FDM printer unless supports are included internally but still may save material and print time.



// In addition you can set `show_box=false;` and then call `make_box()` manually to join and remove more structure to it like in this example.
/*show_box=false;
difference() {
    make_box();
    translate([0, comp_size_y/2 + wall, 0])
    rotate([0, 90, 0])
    cylinder(comp_size_x +wall*2, 10, 10);
}*/

// You can also use calls to `make_internal_box` to create more complex boxes within a larger box that share a single lid.
/*show_box=false;
make_box();
intersection() {     
    faction_x=10; faction_y=comp_size_y; faction_z=5; faction_repeat_x=3; faction_repeat_y=1;
    faction_size_x=calc_size(faction_repeat_x, faction_x, wall=internal_wall, internal_wall=internal_wall);
faction_size_y=calc_size(faction_repeat_y, faction_y, wall=internal_wall, internal_wall=internal_wall);
    
    translate([wall, wall, wall])
    cube([faction_size_x - wall, faction_size_y - wall*2, comp_size_deep]);
            
    translate([wall-internal_wall, wall-internal_wall, wall-internal_wall])
    union() {
        translate([0, 0, 0])
        make_internal_box(faction_x, faction_y, faction_z, wall=internal_wall, repeat_x=faction_repeat_x, repeat_y=faction_repeat_y);
    }
}*/

// This exmaple wil make a complex series of boxes in a larger container. The object's can be used to position other oebjects and create internal structure.
/*comp_size_x = 200;
comp_size_y = 200;
comp_size_deep = 200;

internal_wall=wall/2;

comp1=make_object(x=10, y=30, z=45, offset_x=0, offset_y=0, repeat_x=3, repeat_y=1, color="Red");
comp2=make_object(x=35, y=40, z=45, offset_x=comp1[4][0], offset_y=0, repeat_x=1, repeat_y=1, color="Pink");
comp3=make_object(x=35, y=30, z=45, offset_x=comp2[4][0], offset_y=0, repeat_x=1, repeat_y=1, color="Orange");
comp4=make_object(x=150, y=100, z=75, offset_x=0, offset_y=comp1[4][1], repeat_x=1, repeat_y=1, color="Blue");

complex_box=[
    comp1, comp2, comp3, comp4,
    
];
make_complex_box=true;*/

// Some notes on complex prints:
/* OpenSCAD experience is required to do pretty much any type of customization or complex operations. This will essentaily just make the containers within one larger object with a single lid. Alternatly multiple boxes could be created and then joined together with translations to make a larger object with multiple lids. 
   Due to how variables are passed in OpenSCAD it can be tricky to get the parameters set on the parent box and child boxes as you want. It is best to use global variable assignmets to set the child box parameters, then pass overrides to the `make_box()` call yourself. (You have to also set `show_box=false;` if you do this.)
*/
