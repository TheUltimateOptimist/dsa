package advanced_sorting;

public class BruteCollinearPoints {
    public BruteCollinearPoints(Point[] points) {
        if (points == null) {
            throw new IllegalArgumentException("the points array can not be null");
        }
        for (int i = 0; i < points.length; i++) {
            if (points[i] == null) {
                throw new IllegalArgumentException("A point in the points array can not be null");
            }
        }
        for (int i = 0; i < points.length; i++) {
            for (int j = 0; j < points.length; j++) {
                if (j == i) {
                    continue;
                }
                if (points[i].equals(points[j])) {
                    throw new IllegalArgumentException("All points need to be distinct");
                }
            }
        }
        this.points = points;
        this.segments = null;
    }

    private Point[] points;
    private LineSegment[] segments;

    public int numberOfSegments() {
        if (segments != null) {
            return segments.length;
        }
        calculateSegments();
        return segments.length;
    }

    public LineSegment[] segments() {
        if (segments != null) {
            return segments;
        }
        calculateSegments();
        return segments;
    }

    private void calculateSegments() {
        int count = 0;
        for (int i = 0; i < points.length; i++) {
            for (int j = 0; j < points.length; j++) {
                if (i == j) {
                    continue;
                }
                for (int k = 0; k < points.length; k++) {
                    if (k == j || k == i) {
                        continue;
                    }
                    for (int l = 0; l < points.length; l++) {
                        if (l == k || l == j || l == i) {
                            continue;
                        }
                        double ijSlope = points[i].slopeTo(points[j]);
                        double ikSlope = points[i].slopeTo(points[k]);
                        double ilSlope = points[i].slopeTo(points[l]);
                        if (ijSlope == ikSlope && ikSlope == ilSlope) {
                            segments[count++] = new LineSegment(points[i], points[l]);
                        }
                    }
                }
            }
        }
    }
}
