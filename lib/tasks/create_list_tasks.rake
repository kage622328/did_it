namespace :create_list_tasks do
  desc '毎日0時に全てのlistsとtasksを再作成し、おとといのものを削除する'
  task recreate_lists_and_tasks: :environment do
    # 1. おとといに作成されたリストとタスクを削除する処理
    List.where("created_at < ?", 1.day.ago.midnight).destroy_all
    Task.where("created_at < ?", 1.day.ago.midnight).destroy_all

    # 2. 全てのchildrenに対して新しいリストとタスクを作成する処理
    Child.find_each do |child|
      # 既存のリストを取得し、新しいリストを作成
      existing_lists = child.lists
      new_lists = existing_lists.map do |list|
        new_list = List.create(child: child, name: list.name)

        # 3. 既存のタスクを取得し、新しいタスクを作成する処理
        list.tasks.each do |task|
          Task.create(list: new_list, body: task.body)
        end

        new_list
      end
    end
  end
end
