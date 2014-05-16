module CustomHelpers
  # Exapmle html helper
  # call this <% call_me_inside %>
  def call_me_inside
    out = ['hello']
    out.join("\n")
  end
end
