/****************************************************************************
** Meta object code from reading C++ file 'ioreader.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.11.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "ioreader.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ioreader.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.11.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_IOReader_t {
    QByteArrayData data[25];
    char stringdata0[309];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_IOReader_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_IOReader_t qt_meta_stringdata_IOReader = {
    {
QT_MOC_LITERAL(0, 0, 8), // "IOReader"
QT_MOC_LITERAL(1, 9, 16), // "door1LockChanged"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 17), // "door1ManetChanged"
QT_MOC_LITERAL(4, 45, 17), // "door1StateChanged"
QT_MOC_LITERAL(5, 63, 16), // "door2LockChanged"
QT_MOC_LITERAL(6, 80, 17), // "door2ManetChanged"
QT_MOC_LITERAL(7, 98, 17), // "door2StateChanged"
QT_MOC_LITERAL(8, 116, 16), // "door3LockChanged"
QT_MOC_LITERAL(9, 133, 17), // "door3ManetChanged"
QT_MOC_LITERAL(10, 151, 17), // "door3StateChanged"
QT_MOC_LITERAL(11, 169, 10), // "dpsChanged"
QT_MOC_LITERAL(12, 180, 12), // "lightChanged"
QT_MOC_LITERAL(13, 193, 9), // "timerExec"
QT_MOC_LITERAL(14, 203, 9), // "door1Lock"
QT_MOC_LITERAL(15, 213, 10), // "door1Manet"
QT_MOC_LITERAL(16, 224, 10), // "door1State"
QT_MOC_LITERAL(17, 235, 9), // "door2Lock"
QT_MOC_LITERAL(18, 245, 10), // "door2Manet"
QT_MOC_LITERAL(19, 256, 10), // "door2State"
QT_MOC_LITERAL(20, 267, 9), // "door3Lock"
QT_MOC_LITERAL(21, 277, 10), // "door3Manet"
QT_MOC_LITERAL(22, 288, 10), // "door3State"
QT_MOC_LITERAL(23, 299, 3), // "dps"
QT_MOC_LITERAL(24, 303, 5) // "light"

    },
    "IOReader\0door1LockChanged\0\0door1ManetChanged\0"
    "door1StateChanged\0door2LockChanged\0"
    "door2ManetChanged\0door2StateChanged\0"
    "door3LockChanged\0door3ManetChanged\0"
    "door3StateChanged\0dpsChanged\0lightChanged\0"
    "timerExec\0door1Lock\0door1Manet\0"
    "door1State\0door2Lock\0door2Manet\0"
    "door2State\0door3Lock\0door3Manet\0"
    "door3State\0dps\0light"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_IOReader[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
      11,   86, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      11,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   74,    2, 0x06 /* Public */,
       3,    0,   75,    2, 0x06 /* Public */,
       4,    0,   76,    2, 0x06 /* Public */,
       5,    0,   77,    2, 0x06 /* Public */,
       6,    0,   78,    2, 0x06 /* Public */,
       7,    0,   79,    2, 0x06 /* Public */,
       8,    0,   80,    2, 0x06 /* Public */,
       9,    0,   81,    2, 0x06 /* Public */,
      10,    0,   82,    2, 0x06 /* Public */,
      11,    0,   83,    2, 0x06 /* Public */,
      12,    0,   84,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      13,    0,   85,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,

 // properties: name, type, flags
      14, QMetaType::Int, 0x00495103,
      15, QMetaType::Int, 0x00495103,
      16, QMetaType::Int, 0x00495003,
      17, QMetaType::Int, 0x00495103,
      18, QMetaType::Int, 0x00495103,
      19, QMetaType::Int, 0x00495003,
      20, QMetaType::Int, 0x00495103,
      21, QMetaType::Int, 0x00495103,
      22, QMetaType::Int, 0x00495003,
      23, QMetaType::Int, 0x00495103,
      24, QMetaType::Int, 0x00495003,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,
       6,
       7,
       8,
       9,
      10,

       0        // eod
};

void IOReader::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        IOReader *_t = static_cast<IOReader *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->door1LockChanged(); break;
        case 1: _t->door1ManetChanged(); break;
        case 2: _t->door1StateChanged(); break;
        case 3: _t->door2LockChanged(); break;
        case 4: _t->door2ManetChanged(); break;
        case 5: _t->door2StateChanged(); break;
        case 6: _t->door3LockChanged(); break;
        case 7: _t->door3ManetChanged(); break;
        case 8: _t->door3StateChanged(); break;
        case 9: _t->dpsChanged(); break;
        case 10: _t->lightChanged(); break;
        case 11: _t->timerExec(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::door1LockChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::door1ManetChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::door1StateChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::door2LockChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::door2ManetChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::door2StateChanged)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::door3LockChanged)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::door3ManetChanged)) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::door3StateChanged)) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::dpsChanged)) {
                *result = 9;
                return;
            }
        }
        {
            using _t = void (IOReader::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&IOReader::lightChanged)) {
                *result = 10;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        IOReader *_t = static_cast<IOReader *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->door1Lock(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->door1Manet(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->door1State(); break;
        case 3: *reinterpret_cast< int*>(_v) = _t->door2Lock(); break;
        case 4: *reinterpret_cast< int*>(_v) = _t->door2Manet(); break;
        case 5: *reinterpret_cast< int*>(_v) = _t->door2State(); break;
        case 6: *reinterpret_cast< int*>(_v) = _t->door3Lock(); break;
        case 7: *reinterpret_cast< int*>(_v) = _t->door3Manet(); break;
        case 8: *reinterpret_cast< int*>(_v) = _t->door3State(); break;
        case 9: *reinterpret_cast< int*>(_v) = _t->dps(); break;
        case 10: *reinterpret_cast< int*>(_v) = _t->light(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        IOReader *_t = static_cast<IOReader *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setDoor1Lock(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setDoor1Manet(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setdoor1State(*reinterpret_cast< int*>(_v)); break;
        case 3: _t->setDoor2Lock(*reinterpret_cast< int*>(_v)); break;
        case 4: _t->setDoor2Manet(*reinterpret_cast< int*>(_v)); break;
        case 5: _t->setdoor2State(*reinterpret_cast< int*>(_v)); break;
        case 6: _t->setDoor3Lock(*reinterpret_cast< int*>(_v)); break;
        case 7: _t->setDoor3Manet(*reinterpret_cast< int*>(_v)); break;
        case 8: _t->setdoor3State(*reinterpret_cast< int*>(_v)); break;
        case 9: _t->setDps(*reinterpret_cast< int*>(_v)); break;
        case 10: _t->setlight(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject IOReader::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_IOReader.data,
      qt_meta_data_IOReader,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *IOReader::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *IOReader::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_IOReader.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int IOReader::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 12;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 11;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 11;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 11;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 11;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 11;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void IOReader::door1LockChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void IOReader::door1ManetChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void IOReader::door1StateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void IOReader::door2LockChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void IOReader::door2ManetChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void IOReader::door2StateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void IOReader::door3LockChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void IOReader::door3ManetChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void IOReader::door3StateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void IOReader::dpsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void IOReader::lightChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
