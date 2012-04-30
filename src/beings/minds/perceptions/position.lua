local Position = class('Position')

function Position:initialize(subject,x,y)
  self.subject, self.x, self.y = subject, x, y
end

return Position
