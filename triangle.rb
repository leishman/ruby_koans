# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # WRITE THIS CODE

	raise TriangleError, "Sides must be greater than zero in length" if [a, b, c].min <= 0 
	x, y, z = [a,b,c].sort
	raise TriangleError, "Them sides ain't conducive to makin' a triangle " if x + y <= z 
	[:equilateral, :isosceles, :scalene].fetch([a, b, c].uniq.size-1)
end

# clever code from stackoverflow(http://stackoverflow.com/a/11361502/2302781)
# I did not know abotu fetch or unique methods. That is clever

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
