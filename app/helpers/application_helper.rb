# frozen_string_literal: true

module ApplicationHelper
  def file_icon(filename)
    case filename.to_s.split(".").last
    when "pdf"
      tag.i class: "fa-solid fa-file-pdf"
    when "zip"
      tag.i class: "fa-solid fa-file-zipper"
    else
      tag.i class: "fa-solid fa-file"
    end
  end
end
