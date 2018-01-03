class EvernoteController < ApplicationController
  def index
    @evernotes = Evernote.all
  end

  def show
    @evernote = Evernote.find(params[:id])
  end

  def sync_notes
    client = EvernoteOAuth::Client.new(token: session[:access_token])
    note_store = client.note_store
    notebooks = note_store.listNotebooks(session[:access_token])
    ideas_guid = ''

    notebooks.each do |notebook|
      if notebook.name == 'Ideas'
        ideas_guid = notebook.guid
      end
    end

    filter = Evernote::EDAM::NoteStore::NoteFilter.new
    filter.notebookGuid = ideas_guid

    note_list = note_store.findNotes(session[:access_token], filter, 0, 10000)
    note_list.notes.each do |note|

      doc = Nokogiri::XML(note_store.getNoteContent(note.guid))
      node = doc.xpath("//en-note")
      local_note = Note.find_by_title(note.title)

      unless local_note
        Note.create(
          title: note.title,
          content: node,
          url: note.attributes.sourceURL
        )
      end
    end

    redirect_to root_path
  end
end