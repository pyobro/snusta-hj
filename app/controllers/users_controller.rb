class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token #postman 테스트시 csef_token 인증제거
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #포스팅의 리스트
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #리스트 중의 상세 정보처리
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    #if 지금 들어온 유저가 == edit 하고 싶은 유저이면


  end

  # POST /users
  # POST /users.json
  def create
    p = user_params
    @user = User.new(p)

    respond_to do |format|
      if @user.save
        # 회원가입 후에 바로 로그인이 되도록 한다
        # login(p[:name], p[:password])
        # format.html { redirect_to users_path}

        # 회원가입 후에 로그인 페이지로 넘어간다
        format.html { redirect_to login_path, notice: 'User was successfully created. you can login now' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #프로필수정
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path(@user.name), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #회원탈퇴
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :name, :password, :profile_img)
  end
end
