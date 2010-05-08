class NotesController < ApplicationController
  before_filter :assure_loggon
  before_filter :get_campaign
  before_filter :get_tag_cloud, :only=>[:index]

  # GET /notes
  # GET /notes.xml
  def index
    tag_name = params.delete :tag
    unless tag_name.blank?
      @notes = @campaign.notes & Note.tagged_with(tag_name)
    else
      @notes = @campaign.notes
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.xml
  def create
#    tags = params[:note].delete(:tag_list)
    @note = Note.new(params[:note])        
#    @campaign.notes.tag_list = tags

    respond_to do |format|
      if @campaign.notes << @note
        format.html { redirect_to([@campaign,@note], :notice => 'Note was successfully created.') }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        if params[:continue]
          flash[:notice] = "Saved!"
          format.html { render :action => "edit" }
        else  
          format.html { redirect_to([@campaign,@note], :notice => 'Note was successfully updated.') }
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(campaign_notes_url(@campaign)) }
      format.xml  { head :ok }
    end
  end


  def get_tag_cloud
    @tags = Note.tag_counts_on(:tags)
  end

  
end
