class StatsController < ApplicationController
  before_filter :get_campaign
  before_filter :get_character

  # GET /stats
  # GET /stats.xml
  def index
    @stats = @character.stats.all(:order=>[:category, :name])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stats }
    end
  end

  # GET /stats/1
  # GET /stats/1.xml
  def show
    @stat = Stat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stat }
    end
  end

  # GET /stats/new
  # GET /stats/new.xml
  def new
    @stat = Stat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stat }
    end
  end

  # GET /stats/1/edit
  def edit
    @stat = Stat.find(params[:id])
  end

  # POST /stats
  # POST /stats.xml
  def create
    if params[:stat]
      @stat = Stat.new(params[:stat].merge(:character_id=>@character.id))

      respond_to do |format|
        if @stat.save
          format.html { redirect_to([@campaign, @character, @stat], :notice => 'Stat was successfully created.') }
          format.xml  { render :xml => @stat, :status => :created, :location => @stat }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @stat.errors, :status => :unprocessable_entity }
        end
      end
    elsif params[:quick_stat]
      begin
        Stat.create_quick_stat(@character, params[:quick_stat])
        respond_to do |format|
          format.html { redirect_to(campaign_character_stats_url(@campaign, @character)) }
          format.xml  { head :ok }
        end
      rescue Exception=>e
        flash[:error] = e.message  
        respond_to do |format|
          format.html { redirect_to(campaign_character_stats_url(@campaign, @character)) }
          format.xml  { head 400 }
        end
      end
    end
  end

  # PUT /stats/1
  # PUT /stats/1.xml
  def update
    @stat = Stat.find(params[:id])

    respond_to do |format|
      if @stat.update_attributes(params[:stat])
        format.html { redirect_to(campaign_character_stats_url(@campaign, @character)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.xml
  def destroy
    @stat = Stat.find(params[:id])
    @stat.destroy

    respond_to do |format|
      format.html { redirect_to(campaign_character_stats_url(@campaign, @character)) }
      format.xml  { head :ok }
    end
  end
  
end
