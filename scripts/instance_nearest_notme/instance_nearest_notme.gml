function instance_nearest_notme(xx, yy, obj) {
    var inst = noone;
    var distClosest = infinity;
    with (obj) {
        var dist = point_distance(x, y, xx, yy);
        if (id != other.id && dist < distClosest) {
            inst = id;
            distClosest = dist;
        }
    }
    return inst;
}