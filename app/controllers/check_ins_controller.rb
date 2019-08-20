class CheckInsController < ApplicationController
  def index
    @q = CheckIn.ransack(params[:q])
    @check_ins = @q.result(:distinct => true).includes(:owner, :location).page(params[:page]).per(10)

    render("check_in_templates/index.html.erb")
  end

  def show
    @check_in = CheckIn.find(params.fetch("id_to_display"))

    render("check_in_templates/show.html.erb")
  end

  def new_form
    @check_in = CheckIn.new

    render("check_in_templates/new_form.html.erb")
  end

  def create_row
    @check_in = CheckIn.new

    @check_in.owner_id = params.fetch("owner_id")
    @check_in.location_id = params.fetch("location_id")
    @check_in.image = params.fetch("image") if params.key?("image")
    @check_in.caption = params.fetch("caption")

    if @check_in.valid?
      @check_in.save

      redirect_back(:fallback_location => "/check_ins", :notice => "Check in created successfully.")
    else
      render("check_in_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_user
    @check_in = CheckIn.new

    @check_in.owner_id = params.fetch("owner_id")
    @check_in.location_id = params.fetch("location_id")
    @check_in.image = params.fetch("image") if params.key?("image")
    @check_in.caption = params.fetch("caption")

    if @check_in.valid?
      @check_in.save

      redirect_to("/users/#{@check_in.owner_id}", notice: "CheckIn created successfully.")
    else
      render("check_in_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_location
    @check_in = CheckIn.new

    @check_in.owner_id = params.fetch("owner_id")
    @check_in.location_id = params.fetch("location_id")
    @check_in.image = params.fetch("image") if params.key?("image")
    @check_in.caption = params.fetch("caption")

    if @check_in.valid?
      @check_in.save

      redirect_to("/locations/#{@check_in.location_id}", notice: "CheckIn created successfully.")
    else
      render("check_in_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @check_in = CheckIn.find(params.fetch("prefill_with_id"))

    render("check_in_templates/edit_form.html.erb")
  end

  def update_row
    @check_in = CheckIn.find(params.fetch("id_to_modify"))

    @check_in.owner_id = params.fetch("owner_id")
    @check_in.location_id = params.fetch("location_id")
    @check_in.image = params.fetch("image") if params.key?("image")
    @check_in.caption = params.fetch("caption")

    if @check_in.valid?
      @check_in.save

      redirect_to("/check_ins/#{@check_in.id}", :notice => "Check in updated successfully.")
    else
      render("check_in_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_owner
    @check_in = CheckIn.find(params.fetch("id_to_remove"))

    @check_in.destroy

    redirect_to("/users/#{@check_in.owner_id}", notice: "CheckIn deleted successfully.")
  end

  def destroy_row_from_location
    @check_in = CheckIn.find(params.fetch("id_to_remove"))

    @check_in.destroy

    redirect_to("/locations/#{@check_in.location_id}", notice: "CheckIn deleted successfully.")
  end

  def destroy_row
    @check_in = CheckIn.find(params.fetch("id_to_remove"))

    @check_in.destroy

    redirect_to("/check_ins", :notice => "Check in deleted successfully.")
  end
end
