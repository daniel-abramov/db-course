#pragma once

#include <QDialog>

#include <QtWidgets>
#include <QtSql>

class PersonEditForm : public QDialog
{
    Q_OBJECT

public:
    explicit PersonEditForm(int id = -1, bool isCoach = false, QWidget* parent = nullptr);

    void done(int result);

private slots:
    void updateExperienceModel();

    void addPerson();
    void deletePerson();

    void addExperience();
    void deleteExperience();

private:
    bool displayCoachWidgets;

    QDataWidgetMapper* mapper;
    QSqlTableModel* personModel;
    QSqlRelationalTableModel* experienceModel;
    QTableView* experienceView;

    QLineEdit* firstnameEdit;
    QLineEdit* lastnameEdit;
    QLineEdit* middlenameEdit;
    QDateEdit* birthEdit;
};

