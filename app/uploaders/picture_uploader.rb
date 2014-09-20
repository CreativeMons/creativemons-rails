# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  version :large do
    process :resize_to_fill => [1140, 550]
  end

  version :medium do
    process :resize_to_fill => [360, 210]
  end

  version :thumb do
    process :resize_to_fill => [100, 100]
  end

  def store_dir
    "system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
