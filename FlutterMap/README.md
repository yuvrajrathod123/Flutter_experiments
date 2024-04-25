# mapprj

Explanation: 

    SizedBox: This widget is used to constrain its child to a specific size. In this case, it constrains its child to a height of 500 pixels and a width of 400 pixels.

    Visibility: This widget controls the visibility of its child based on the value of the visible property. If isVisible is true, the child is visible; otherwise, it's hidden.

    FlutterMap: This is a widget provided by the flutter_map package, used to display a map. It requires a set of options (defined in MapOptions) and can have children like any other Flutter widget.

    MapOptions: This class defines the options for configuring the map, such as the initial center (latitude and longitude) and the zoom level.

    nonRotatedChildren: This parameter allows you to add non-rotated children to the map, such as widgets that should remain static regardless of the map rotation. In this case, an AttributionWidget is added as a non-rotated child, displaying attribution information.

    TileLayer: This widget represents a tile layer on the map. It fetches map tiles from a specified URL template and renders them on the map. Here, it fetches tiles from OpenStreetMap using the provided URL template.

    PolylineLayer: This widget represents a layer for drawing polylines on the map. It takes a list of Polyline objects and renders them on the map. Here, a single polyline is drawn using the routpoints list as its points, with a specified color and stroke width.

    Polyline: This class represents a polyline on the map. It requires a list of points (routpoints), which are the coordinates that define the polyline's shape. Additionally, you can specify the polyline's color and stroke width.
