class PhotosController < ApplicationController
  def index
    @photos = Photo.all

    render("photo_templates/index.html.erb")
  end

  def show
    @like = Like.new
    @comment = Comment.new
    @photo = Photo.find(params.fetch("id_to_display"))

    render("photo_templates/show.html.erb")
  end

  def new_form
    @photo = Photo.new

    render("photo_templates/new_form.html.erb")
  end

  def create_row
    @photo = Photo.new

    @photo.author_id = params.fetch("author_id")
    @photo.comments_count = params.fetch("comments_count")
    @photo.likes_count = params.fetch("likes_count")
    @photo.location_id = params.fetch("location_id")
    @photo.caption = params.fetch("caption")
    @photo.image = params.fetch("image") if params.key?("image")

    if @photo.valid?
      @photo.save

      redirect_back(:fallback_location => "/photos", :notice => "Photo created successfully.")
    else
      render("photo_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_user
    @photo = Photo.new

    @photo.author_id = params.fetch("author_id")
    @photo.comments_count = params.fetch("comments_count")
    @photo.likes_count = params.fetch("likes_count")
    @photo.location_id = params.fetch("location_id")
    @photo.caption = params.fetch("caption")
    @photo.image = params.fetch("image") if params.key?("image")

    if @photo.valid?
      @photo.save

      redirect_to("/users/#{@photo.author_id}", notice: "Photo created successfully.")
    else
      render("photo_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_location
    @photo = Photo.new

    @photo.author_id = params.fetch("author_id")
    @photo.comments_count = params.fetch("comments_count")
    @photo.likes_count = params.fetch("likes_count")
    @photo.location_id = params.fetch("location_id")
    @photo.caption = params.fetch("caption")
    @photo.image = params.fetch("image") if params.key?("image")

    if @photo.valid?
      @photo.save

      redirect_to("/locations/#{@photo.location_id}", notice: "Photo created successfully.")
    else
      render("photo_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @photo = Photo.find(params.fetch("prefill_with_id"))

    render("photo_templates/edit_form.html.erb")
  end

  def update_row
    @photo = Photo.find(params.fetch("id_to_modify"))

    @photo.author_id = params.fetch("author_id")
    @photo.comments_count = params.fetch("comments_count")
    @photo.likes_count = params.fetch("likes_count")
    @photo.location_id = params.fetch("location_id")
    @photo.caption = params.fetch("caption")
    @photo.image = params.fetch("image") if params.key?("image")

    if @photo.valid?
      @photo.save

      redirect_to("/photos/#{@photo.id}", :notice => "Photo updated successfully.")
    else
      render("photo_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_author
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/users/#{@photo.author_id}", notice: "Photo deleted successfully.")
  end

  def destroy_row_from_location
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/locations/#{@photo.location_id}", notice: "Photo deleted successfully.")
  end

  def destroy_row
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/photos", :notice => "Photo deleted successfully.")
  end
end
