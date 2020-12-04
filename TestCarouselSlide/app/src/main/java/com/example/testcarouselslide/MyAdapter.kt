package com.example.testcarouselslide

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter


class MyAdapter(fa: FragmentActivity?, var mCount: Int) : FragmentStateAdapter(fa!!) {
    override fun createFragment(position: Int): Fragment{
        val index = getRealPosition(position)
        return if (index == 0) FragFirst() else if (index == 1) FragSecond() else if (index == 2) FragThird() else FragFourth()
    }

    override fun getItemCount(): Int {
        return 2000
    }

    private fun getRealPosition(position: Int): Int {
        return position % mCount
    }
}