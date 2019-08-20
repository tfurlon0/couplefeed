class CheckInsController < ApplicationController
  def index
    @check_ins = CheckIn.all

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
    @check_in.image = params.fetch("image")
    @check_in.caption = params.fetch("caption")

    if @check_in.valid?
      @check_in.save

      redirect_back(:fallback_location => "/check_ins", :notice => "Check in created successfully.")
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
    @check_in.image = params.fetch("image")
    @check_in.caption = params.fetch("caption")

    if @check_in.valid?
      @check_in.save

      redirect_to("/check_ins/#{@check_in.id}", :notice => "Check in updated successfully.")
    else
      render("check_in_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @check_in = CheckIn.find(params.fetch("id_to_remove"))

    @check_in.destroy

    redirect_to("/check_ins", :notice => "Check in deleted successfully.")
  end
end
