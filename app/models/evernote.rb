class Evernote
# -*- coding: utf-8 -*-
require "evernote_oauth"
$LOAD_PATH.push(File.expand_path(File.dirname(__FILE__)))
require "authorize_app.rb"

puts("NoteStore取得")
token = "your_token"
client = EvernoteOAuth::Client.new(:token => token, :sandbox => true)
note_store = client.note_store

puts("ノートブック取得")
notebook_name = "Stockapp note" # GUIDをとりたいノートブックの名前
notebooks = note_store.listNotebooks.select do |notebook|
  notebook.name == notebook_name
end
notebook_guid = notebooks.first.guid
puts("notebook '#{notebook_name}' GUID:#{notebook_guid}")

puts("ノート作成：")

ENML_HEADER = <<HEADER
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
HEADER

note_content = <<CONTENT
#{ENML_HEADER}
<en-note>Hello, my Evernote (from Ruby)!</en-note>
CONTENT

note = Evernote::EDAM::Type::Note.new
note.title        = "ノートのタイトル"
note.notebookGuid = notebook_guid
note.content      = note_content

note_store.createNote(token, note)
puts("ここでスクショ取る")
gets

puts("ノート検索：")
filter = Evernote::EDAM::NoteStore::NoteFilter.new
filter.words = "Ruby"

found_note = note_store.findNotes(token, filter, 0, 1).notes.first
p found_note #=>

puts("ノート更新：")

new_note = Evernote::EDAM::Type::Note.new
new_note.title   = "#{found_note.title}を変えてみました"
new_note.guid    = found_note.guid
new_note.content = <<CONTENT
#{ENML_HEADER}
<en-note>
<h1>Hello Evernote!</h1>
<div>This is an example for my entry in Qiita.</div>
</en-note>
CONTENT

note_store.updateNote(token, new_note)
puts("ここでスクショとったら完了")