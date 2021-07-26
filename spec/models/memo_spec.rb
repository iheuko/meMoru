require 'rails_helper'

RSpec.describe Memo, type: :model do
  describe '#create' do
    before do
      @memo = FactoryBot.build(:memo)
    end
    describe 'メモ新規登録' do
      context '保存できる場合' do
        it '正しく入力すれば登録できること' do
          expect(@memo).to be_valid
        end

        it 'memo_titleが空でも登録できること' do
          @memo.memo_title = ''
          expect(@memo).to be_valid
        end
      end

      context '保存できない場合' do
        it 'memoが空では登録できないこと' do
          @memo.memo = ''
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Memo can't be blank")
        end

        it 'frame_type_idが空では登録できないこと' do
          @memo.frame_type_id = ''
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Frame type is not a number")
        end

        it 'frame_type_idは文字では登録できないこと' do
          @memo.frame_type_id = 'あ'
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Frame type is not a number")
        end

        it 'user_idが空では登録できないこと' do
          @memo.user_id = ''
          @memo.valid?
          expect(@memo.errors.full_messages).to include("User can't be blank")
        end

      end
    end 
  end
end