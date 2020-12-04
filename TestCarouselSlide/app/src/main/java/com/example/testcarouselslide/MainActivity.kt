package com.example.testcarouselslide

import android.os.Bundle
import androidx.core.view.ViewCompat
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter
import androidx.viewpager2.widget.ViewPager2
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : FragmentActivity() {

    private var pagerAdapter: FragmentStateAdapter? = null
    private val numPage = 4

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Adapter
        pagerAdapter = MyAdapter(this, numPage)
        viewpager.adapter = pagerAdapter

        // Indicator
        indicator.setViewPager(viewpager)
        indicator.createIndicators(numPage, 0)

        // ViewPager Setting
        viewpager.orientation = ViewPager2.ORIENTATION_HORIZONTAL
        viewpager.currentItem = 1000
        viewpager.offscreenPageLimit = 3

        viewpager.registerOnPageChangeCallback(object : ViewPager2.OnPageChangeCallback(){
            override fun onPageScrolled(
                position: Int,
                positionOffset: Float,
                positionOffsetPixels: Int
            ) {
                super.onPageScrolled(position, positionOffset, positionOffsetPixels)
                if(positionOffsetPixels == 0) {
                    viewpager.currentItem = position
                }
            }

            override fun onPageSelected(position: Int) {
                super.onPageSelected(position)
                indicator.animatePageSelected(position%numPage)
            }
        })

        val pageMargin = resources.getDimensionPixelOffset(R.dimen.pageMargin)
        val pageOffset = resources.getDimensionPixelOffset(R.dimen.offset)

        viewpager.setPageTransformer { page, position ->
            val myOffset = position * -(2 * pageOffset + pageMargin)
            if(viewpager.orientation == ViewPager2.ORIENTATION_HORIZONTAL) {
                if(ViewCompat.getLayoutDirection(viewpager) == ViewCompat.LAYOUT_DIRECTION_RTL) {
                    page.translationX = -myOffset
                }
                else {
                    page.translationX = myOffset
                }
            } else {
                page.translationX = myOffset
            }
        }
    }
}