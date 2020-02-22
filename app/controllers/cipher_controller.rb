class CipherController < ApplicationController
  def index
    @cipher_texts = @current_user.cipher_texts.latest if @current_user
    @cipher_form = @current_user.cipher_texts.build if @current_user
  end

  def create
    cipher_params.merge!(text: cryptor.encrypt(cipher_params[:text]))
    @cipher_form = @current_user.cipher_texts.create(cipher_params)

    redirect_to action: :index
  end

  def show
    @cipher = @current_user.cipher_texts.find(params[:id])
  end

  def decrypt
    @cipher = @current_user.cipher_texts.find(params[:id])
    @decrypt_text = Cipher.new(@cipher.text, cipher_params[:shift]).decrypt(@cipher.text)
  end

  private

  def cryptor
    @cryptor ||= Cipher.new(cipher_params[:text], cipher_params[:shift])
  end

  def cipher_params
    @cipher_params ||= params.require(:cipher_text).permit(:text, :shift, :id)
  end
end
