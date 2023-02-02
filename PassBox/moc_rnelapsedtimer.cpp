/****************************************************************************
** Meta object code from reading C++ file 'rnelapsedtimer.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.11.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "rnelapsedtimer.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'rnelapsedtimer.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.11.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_RNElapsedTimer_t {
    QByteArrayData data[10];
    char stringdata0[95];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_RNElapsedTimer_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_RNElapsedTimer_t qt_meta_stringdata_RNElapsedTimer = {
    {
QT_MOC_LITERAL(0, 0, 14), // "RNElapsedTimer"
QT_MOC_LITERAL(1, 15, 14), // "runningChanged"
QT_MOC_LITERAL(2, 30, 0), // ""
QT_MOC_LITERAL(3, 31, 14), // "elapsedChanged"
QT_MOC_LITERAL(4, 46, 5), // "start"
QT_MOC_LITERAL(5, 52, 4), // "stop"
QT_MOC_LITERAL(6, 57, 7), // "elapsed"
QT_MOC_LITERAL(7, 65, 10), // "setElapsed"
QT_MOC_LITERAL(8, 76, 10), // "newElapsed"
QT_MOC_LITERAL(9, 87, 7) // "running"

    },
    "RNElapsedTimer\0runningChanged\0\0"
    "elapsedChanged\0start\0stop\0elapsed\0"
    "setElapsed\0newElapsed\0running"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_RNElapsedTimer[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       2,   52, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x06 /* Public */,
       3,    0,   45,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    0,   46,    2, 0x0a /* Public */,
       5,    0,   47,    2, 0x0a /* Public */,
       6,    0,   48,    2, 0x0a /* Public */,
       7,    1,   49,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Int,
    QMetaType::Void, QMetaType::Int,    8,

 // properties: name, type, flags
       6, QMetaType::Int, 0x00495103,
       9, QMetaType::Bool, 0x00495003,

 // properties: notify_signal_id
       1,
       0,

       0        // eod
};

void RNElapsedTimer::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        RNElapsedTimer *_t = static_cast<RNElapsedTimer *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->runningChanged(); break;
        case 1: _t->elapsedChanged(); break;
        case 2: _t->start(); break;
        case 3: _t->stop(); break;
        case 4: { int _r = _t->elapsed();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 5: _t->setElapsed((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (RNElapsedTimer::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&RNElapsedTimer::runningChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (RNElapsedTimer::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&RNElapsedTimer::elapsedChanged)) {
                *result = 1;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        RNElapsedTimer *_t = static_cast<RNElapsedTimer *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->elapsed(); break;
        case 1: *reinterpret_cast< bool*>(_v) = _t->m_running; break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        RNElapsedTimer *_t = static_cast<RNElapsedTimer *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setElapsed(*reinterpret_cast< int*>(_v)); break;
        case 1:
            if (_t->m_running != *reinterpret_cast< bool*>(_v)) {
                _t->m_running = *reinterpret_cast< bool*>(_v);
                Q_EMIT _t->runningChanged();
            }
            break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject RNElapsedTimer::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_RNElapsedTimer.data,
      qt_meta_data_RNElapsedTimer,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *RNElapsedTimer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *RNElapsedTimer::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_RNElapsedTimer.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int RNElapsedTimer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void RNElapsedTimer::runningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void RNElapsedTimer::elapsedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
