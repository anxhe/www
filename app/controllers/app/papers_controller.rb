class App::PapersController < AppController

  before_filter :protect_from_forgery, :except => [:create, :new]

  def create
    @paper = Paper.create! paper_params

    if @paper
      flash[:notice] = 'Successfully created'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      render root_path
    end
  end
  private

  def paper_params
    @params = params.require(:paper).permit(:topic, :name, :email, :description)
  end
end