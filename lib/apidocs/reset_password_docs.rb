class ApiSessionRecovering::ResetPasswordDocs
  require 'apidocs/unprocessable_entity'
  include Swagger::Blocks

  swagger_path '/session_recovering/reset_password' do
    operation :post do
      key :description, 'reset_password'
      key :summary, 'reset_password'
      key :tags, ['Reset password']
      key :consumes, ['multipart/form-data']
      security do
        key :api_key, []
      end
      parameter do
        key :name, 'reset_password[token]'
        key :in, :formData
        key :required, true
        key :type, :string
      end
      parameter do
        key :name, 'reset_password[email]'
        key :in, :formData
        key :required, true
        key :type, :string
      end
      parameter do
        key :name, 'reset_password[password]'
        key :in, :formData
        key :required, true
        key :type, :string
        key :format, :password
      end
      parameter do
        key :name, 'reset_password[password_confirmation]'
        key :in, :formData
        key :required, true
        key :type, :string
        key :format, :password
      end

      response '204' do
        key :description, 'Success without body'
      end

      response '404' do
        key :description, 'NotFound'
      end

      response '422' do
        key :description, 'UnprocessableEntity'
        schema do
          key :'$ref', :UnprocessableEntity
        end
      end
    end
  end
end

