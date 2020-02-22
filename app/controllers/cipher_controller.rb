class CipherController < ApplicationController
  def index
    @cipher_texts = CipherText.latest
    @cipher_form = CipherText.new
  end

  def create
    cipher_params.merge!(text: cryptor.encrypt(cipher_params[:text]))
    @cipher_form = CipherText.create(cipher_params)

    redirect_to action: :index
  end

  def show
    @cipher = CipherText.find(params[:id])
  end

  def decrypt
    @cipher = CipherText.find(params[:id])
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
