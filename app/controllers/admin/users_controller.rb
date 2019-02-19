module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    
    # def index
    #   super
    #   @resources = User.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def new
      @user = User.new
    end

    def show
        
    end

    def edit
        
    end
    def update
        
    end
    def destroy
      @user.destroy
      redirect_to admin_root_path
    end

    def index
      @all_users = User.all
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      
    end
  end
end
